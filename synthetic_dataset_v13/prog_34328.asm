; DESCRIPTION: Renders a cyan box of size 20x50 starting at (288, 162).
; PLAN: r0=288(x), r1=162(y), r2=20(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 162
LDI r2, 20
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
