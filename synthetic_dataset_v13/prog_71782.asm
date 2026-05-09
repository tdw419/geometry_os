; DESCRIPTION: Composite: Renders a cyan line between points (11, 94) and (373, 113) then Places a green 101x16 rectangle at position (361, 204).
; PLAN: r0=11(x1), r1=94(y1), r2=373(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=361(x), r6=204(y), r7=101(width), r8=16(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 11
LDI r1, 94
LDI r2, 373
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 204
LDI r7, 101
LDI r8, 16
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
