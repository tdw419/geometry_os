; DESCRIPTION: Composite: Draws a green line from (98, 178) to (457, 221) then Places a purple 93x62 rectangle at position (387, 174).
; PLAN: r0=98(x1), r1=178(y1), r2=457(x2), r3=221(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=387(x), r6=174(y), r7=93(width), r8=62(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 178
LDI r2, 457
LDI r3, 221
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 174
LDI r7, 93
LDI r8, 62
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
