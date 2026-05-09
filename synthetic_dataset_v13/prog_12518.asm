; DESCRIPTION: Places a yellow 39x52 rectangle at position (320, 187).
; PLAN: r0=320(x), r1=187(y), r2=39(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 187
LDI r2, 39
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
