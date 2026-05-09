; DESCRIPTION: Composite: Places a green dot at position (294, 79) then Renders a blue line between points (71, 111) and (242, 59) then Places a white 86x50 rectangle at position (216, 69).
; PLAN: r0=294(x), r1=79(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=71(x1), r6=111(y1), r7=242(x2), r8=59(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=216(x), r11=69(y), r12=86(width), r13=50(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 79
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 71
LDI r6, 111
LDI r7, 242
LDI r8, 59
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 69
LDI r12, 86
LDI r13, 50
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
