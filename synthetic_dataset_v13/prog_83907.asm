; DESCRIPTION: Composite: Places a black 53x40 rectangle at position (39, 181) then Draws a green line from (379, 245) to (479, 174).
; PLAN: r0=39(x), r1=181(y), r2=53(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=379(x1), r6=245(y1), r7=479(x2), r8=174(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 39
LDI r1, 181
LDI r2, 53
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 245
LDI r7, 479
LDI r8, 174
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
