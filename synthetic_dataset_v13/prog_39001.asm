; DESCRIPTION: Composite: Renders a cyan box of size 70x23 starting at (291, 204) then Sets a single cyan pixel at (470, 23).
; PLAN: r0=291(x), r1=204(y), r2=70(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=470(x), r6=23(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 291
LDI r1, 204
LDI r2, 70
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 23
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
