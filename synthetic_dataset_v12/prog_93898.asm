; DESCRIPTION: Composite: Places a red dot at position (500, 189) then Renders a blue box of size 61x120 starting at (53, 66).
; PLAN: r0=500(x), r1=189(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=66(y), r7=61(width), r8=120(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 500
LDI r1, 189
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 53
LDI r6, 66
LDI r7, 61
LDI r8, 120
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
