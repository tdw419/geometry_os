; DESCRIPTION: Composite: Places a orange dot at position (168, 237) then Renders a magenta box of size 105x120 starting at (303, 29).
; PLAN: r0=168(x), r1=237(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=303(x), r6=29(y), r7=105(width), r8=120(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 237
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 303
LDI r6, 29
LDI r7, 105
LDI r8, 120
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
