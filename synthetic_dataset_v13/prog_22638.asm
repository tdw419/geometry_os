; DESCRIPTION: Composite: Places a blue 113x27 rectangle at position (320, 25) then Renders a cyan line between points (249, 45) and (121, 18).
; PLAN: r0=320(x), r1=25(y), r2=113(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=249(x1), r6=45(y1), r7=121(x2), r8=18(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 320
LDI r1, 25
LDI r2, 113
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 45
LDI r7, 121
LDI r8, 18
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
