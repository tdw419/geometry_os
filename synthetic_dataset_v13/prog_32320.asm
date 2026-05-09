; DESCRIPTION: Places a yellow 113x47 rectangle at position (271, 182).
; PLAN: r0=271(x), r1=182(y), r2=113(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 182
LDI r2, 113
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
