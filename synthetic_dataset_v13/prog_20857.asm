; DESCRIPTION: Composite: Places a red dot at position (271, 21) then Renders a yellow box of size 120x82 starting at (114, 64).
; PLAN: r0=271(x), r1=21(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=114(x), r6=64(y), r7=120(width), r8=82(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 21
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 114
LDI r6, 64
LDI r7, 120
LDI r8, 82
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
