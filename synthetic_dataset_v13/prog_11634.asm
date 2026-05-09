; DESCRIPTION: Composite: Places a magenta dot at position (80, 230) then Places a blue 39x10 rectangle at position (166, 121).
; PLAN: r0=80(x), r1=230(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=166(x), r6=121(y), r7=39(width), r8=10(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 80
LDI r1, 230
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 166
LDI r6, 121
LDI r7, 39
LDI r8, 10
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
