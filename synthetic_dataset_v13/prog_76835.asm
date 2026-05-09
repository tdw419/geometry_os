; DESCRIPTION: Renders a cyan box of size 15x79 starting at (416, 100).
; PLAN: r0=416(x), r1=100(y), r2=15(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 100
LDI r2, 15
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
