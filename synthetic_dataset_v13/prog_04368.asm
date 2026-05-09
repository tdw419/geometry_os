; DESCRIPTION: Renders a cyan box of size 11x46 starting at (123, 209).
; PLAN: r0=123(x), r1=209(y), r2=11(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 209
LDI r2, 11
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
