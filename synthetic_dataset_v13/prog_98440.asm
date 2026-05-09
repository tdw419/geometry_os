; DESCRIPTION: Renders a cyan box of size 98x17 starting at (112, 38).
; PLAN: r0=112(x), r1=38(y), r2=98(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 38
LDI r2, 98
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
