; DESCRIPTION: Composite: Places a red 36x107 rectangle at position (353, 123) then Places a magenta dot at position (504, 167).
; PLAN: r0=353(x), r1=123(y), r2=36(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=504(x), r6=167(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 353
LDI r1, 123
LDI r2, 36
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 167
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
