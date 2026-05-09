; DESCRIPTION: Renders a cyan box of size 91x17 starting at (46, 109).
; PLAN: r0=46(x), r1=109(y), r2=91(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 109
LDI r2, 91
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
