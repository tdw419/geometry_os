; DESCRIPTION: Composite: Places a cyan dot at position (402, 253) then Draws a orange line from (404, 111) to (136, 193) then Places a orange 108x54 rectangle at position (209, 30).
; PLAN: r0=402(x), r1=253(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=404(x1), r6=111(y1), r7=136(x2), r8=193(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=209(x), r11=30(y), r12=108(width), r13=54(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 402
LDI r1, 253
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 404
LDI r6, 111
LDI r7, 136
LDI r8, 193
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 30
LDI r12, 108
LDI r13, 54
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
