; DESCRIPTION: Composite: Places a red 111x16 rectangle at position (301, 161) then Renders a cyan line between points (284, 122) and (176, 121).
; PLAN: r0=301(x), r1=161(y), r2=111(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x1), r6=122(y1), r7=176(x2), r8=121(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 161
LDI r2, 111
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 122
LDI r7, 176
LDI r8, 121
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
