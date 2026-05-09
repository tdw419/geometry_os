; DESCRIPTION: Places a yellow 74x82 rectangle at position (305, 71).
; PLAN: r0=305(x), r1=71(y), r2=74(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 71
LDI r2, 74
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
