; DESCRIPTION: Renders a cyan box of size 109x19 starting at (290, 188).
; PLAN: r0=290(x), r1=188(y), r2=109(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 188
LDI r2, 109
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
