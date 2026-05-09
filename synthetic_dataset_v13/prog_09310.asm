; DESCRIPTION: Composite: Renders a white disk with center (152, 83) and radius 48 then Places a orange 25x116 rectangle at position (28, 111).
; PLAN: r0=152(x), r1=83(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=28(x), r6=111(y), r7=25(width), r8=116(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 152
LDI r1, 83
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 28
LDI r6, 111
LDI r7, 25
LDI r8, 116
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
