; DESCRIPTION: Renders a cyan box of size 45x19 starting at (290, 128).
; PLAN: r0=290(x), r1=128(y), r2=45(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 128
LDI r2, 45
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
