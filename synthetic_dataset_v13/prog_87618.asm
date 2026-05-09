; DESCRIPTION: Places a red 67x52 rectangle at position (404, 73).
; PLAN: r0=404(x), r1=73(y), r2=67(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 73
LDI r2, 67
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
