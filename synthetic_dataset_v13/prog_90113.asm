; DESCRIPTION: Draws a cyan rectangle at (189, 129) with width 57 and height 113.
; PLAN: r0=189(x), r1=129(y), r2=57(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 129
LDI r2, 57
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
