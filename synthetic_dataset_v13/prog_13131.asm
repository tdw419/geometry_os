; DESCRIPTION: Composite: Renders a orange box of size 38x65 starting at (329, 170) then Places a cyan circle of radius 27 at center (206, 111).
; PLAN: r0=329(x), r1=170(y), r2=38(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=206(x), r6=111(y), r7=27(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 329
LDI r1, 170
LDI r2, 38
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 111
LDI r7, 27
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
