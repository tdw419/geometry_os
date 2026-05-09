; DESCRIPTION: Composite: Draws a cyan line from (366, 4) to (213, 221) then Places a magenta 41x53 rectangle at position (356, 56).
; PLAN: r0=366(x1), r1=4(y1), r2=213(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=356(x), r6=56(y), r7=41(width), r8=53(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 4
LDI r2, 213
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 56
LDI r7, 41
LDI r8, 53
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
