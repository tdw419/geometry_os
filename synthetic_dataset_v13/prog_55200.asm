; DESCRIPTION: Draws a cyan rectangle at (386, 152) with width 80 and height 68.
; PLAN: r0=386(x), r1=152(y), r2=80(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 152
LDI r2, 80
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
