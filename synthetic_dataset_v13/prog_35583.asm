; DESCRIPTION: Composite: Places a orange dot at position (247, 193) then Renders a blue box of size 61x89 starting at (56, 132).
; PLAN: r0=247(x), r1=193(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=56(x), r6=132(y), r7=61(width), r8=89(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 193
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 56
LDI r6, 132
LDI r7, 61
LDI r8, 89
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
