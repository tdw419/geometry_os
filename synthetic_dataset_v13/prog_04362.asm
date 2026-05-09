; DESCRIPTION: Composite: Places a magenta 12x47 rectangle at position (309, 152) then Places a blue circle of radius 74 at center (230, 146).
; PLAN: r0=309(x), r1=152(y), r2=12(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x), r6=146(y), r7=74(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 309
LDI r1, 152
LDI r2, 12
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 146
LDI r7, 74
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
