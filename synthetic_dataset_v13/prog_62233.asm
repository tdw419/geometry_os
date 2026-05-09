; DESCRIPTION: Composite: Renders a yellow box of size 98x68 starting at (245, 52) then Places a cyan circle of radius 67 at center (392, 94).
; PLAN: r0=245(x), r1=52(y), r2=98(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=392(x), r6=94(y), r7=67(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 245
LDI r1, 52
LDI r2, 98
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 94
LDI r7, 67
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
