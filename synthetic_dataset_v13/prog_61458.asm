; DESCRIPTION: Composite: Places a orange 115x67 rectangle at position (227, 188) then Renders a purple disk with center (446, 129) and radius 21.
; PLAN: r0=227(x), r1=188(y), r2=115(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x), r6=129(y), r7=21(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 227
LDI r1, 188
LDI r2, 115
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 129
LDI r7, 21
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
