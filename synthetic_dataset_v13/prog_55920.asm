; DESCRIPTION: Composite: Places a magenta dot at position (409, 200) then Renders a yellow box of size 103x95 starting at (404, 112).
; PLAN: r0=409(x), r1=200(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=404(x), r6=112(y), r7=103(width), r8=95(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 200
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 404
LDI r6, 112
LDI r7, 103
LDI r8, 95
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
