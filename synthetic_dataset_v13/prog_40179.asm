; DESCRIPTION: Renders a cyan box of size 55x22 starting at (330, 20).
; PLAN: r0=330(x), r1=20(y), r2=55(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 20
LDI r2, 55
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
