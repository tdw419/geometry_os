; DESCRIPTION: Composite: Places a magenta line segment connecting (256, 67) to (384, 166) then Places a white 104x50 rectangle at position (391, 166).
; PLAN: r0=256(x1), r1=67(y1), r2=384(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=166(y), r7=104(width), r8=50(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 67
LDI r2, 384
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 166
LDI r7, 104
LDI r8, 50
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
