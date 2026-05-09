; DESCRIPTION: Composite: Renders a white box of size 61x22 starting at (94, 82) then Places a green dot at position (54, 165).
; PLAN: r0=94(x), r1=82(y), r2=61(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=54(x), r6=165(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 94
LDI r1, 82
LDI r2, 61
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 165
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
