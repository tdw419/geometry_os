; DESCRIPTION: Composite: Places a cyan line segment connecting (197, 147) to (377, 143) then Places a purple 86x81 rectangle at position (168, 19).
; PLAN: r0=197(x1), r1=147(y1), r2=377(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=19(y), r7=86(width), r8=81(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 197
LDI r1, 147
LDI r2, 377
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 19
LDI r7, 86
LDI r8, 81
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
