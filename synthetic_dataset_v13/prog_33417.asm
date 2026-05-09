; DESCRIPTION: Composite: Creates a cyan circular shape at (211, 67) with radius 62 then Renders a green box of size 41x39 starting at (323, 213).
; PLAN: r0=211(x), r1=67(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=323(x), r6=213(y), r7=41(width), r8=39(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 67
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 323
LDI r6, 213
LDI r7, 41
LDI r8, 39
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
