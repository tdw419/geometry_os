; DESCRIPTION: Renders a cyan box of size 33x20 starting at (79, 178).
; PLAN: r0=79(x), r1=178(y), r2=33(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 178
LDI r2, 33
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
