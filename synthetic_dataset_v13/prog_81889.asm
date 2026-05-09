; DESCRIPTION: Places a yellow 108x38 rectangle at position (340, 213).
; PLAN: r0=340(x), r1=213(y), r2=108(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 213
LDI r2, 108
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
