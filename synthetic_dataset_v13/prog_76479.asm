; DESCRIPTION: Composite: Places a cyan 113x34 rectangle at position (134, 51) then Places a green line segment connecting (172, 228) to (308, 4).
; PLAN: r0=134(x), r1=51(y), r2=113(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x1), r6=228(y1), r7=308(x2), r8=4(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 51
LDI r2, 113
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 228
LDI r7, 308
LDI r8, 4
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
