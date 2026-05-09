; DESCRIPTION: Places a red 38x113 rectangle at position (403, 85).
; PLAN: r0=403(x), r1=85(y), r2=38(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 85
LDI r2, 38
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
