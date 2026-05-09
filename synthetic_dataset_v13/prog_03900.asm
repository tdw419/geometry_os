; DESCRIPTION: Composite: Places a orange 98x60 rectangle at position (297, 152) then Draws a green circle centered at (415, 204) with radius 26.
; PLAN: r0=297(x), r1=152(y), r2=98(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x), r6=204(y), r7=26(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 297
LDI r1, 152
LDI r2, 98
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 204
LDI r7, 26
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
