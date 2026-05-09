; DESCRIPTION: Composite: Places a green line segment connecting (324, 20) to (57, 240) then Places a orange 55x73 rectangle at position (320, 111).
; PLAN: r0=324(x1), r1=20(y1), r2=57(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=111(y), r7=55(width), r8=73(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 324
LDI r1, 20
LDI r2, 57
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 111
LDI r7, 55
LDI r8, 73
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
