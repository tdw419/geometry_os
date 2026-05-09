; DESCRIPTION: Places a red 96x25 rectangle at position (403, 7).
; PLAN: r0=403(x), r1=7(y), r2=96(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 7
LDI r2, 96
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
