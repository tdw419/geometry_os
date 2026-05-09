; DESCRIPTION: Places a red 39x17 rectangle at position (328, 16).
; PLAN: r0=328(x), r1=16(y), r2=39(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 16
LDI r2, 39
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
