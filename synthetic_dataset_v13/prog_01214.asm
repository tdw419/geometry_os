; DESCRIPTION: Composite: Renders a yellow box of size 90x117 starting at (169, 44) then Sets a single black pixel at (228, 59).
; PLAN: r0=169(x), r1=44(y), r2=90(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=228(x), r6=59(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 169
LDI r1, 44
LDI r2, 90
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 59
LDI r7, 0x000000
PSET r5, r6, r7
HALT
