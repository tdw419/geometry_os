; DESCRIPTION: Composite: Places a magenta dot at position (263, 202) then Renders a green box of size 68x60 starting at (400, 98).
; PLAN: r0=263(x), r1=202(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=400(x), r6=98(y), r7=68(width), r8=60(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 202
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 400
LDI r6, 98
LDI r7, 68
LDI r8, 60
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
