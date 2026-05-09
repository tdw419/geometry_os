; DESCRIPTION: Composite: Places a green 22x15 rectangle at position (258, 181) then Renders a red disk with center (305, 193) and radius 59.
; PLAN: r0=258(x), r1=181(y), r2=22(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=305(x), r6=193(y), r7=59(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 258
LDI r1, 181
LDI r2, 22
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 193
LDI r7, 59
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
