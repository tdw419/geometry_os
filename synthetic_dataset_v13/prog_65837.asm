; DESCRIPTION: Places a yellow 27x116 rectangle at position (304, 38).
; PLAN: r0=304(x), r1=38(y), r2=27(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 38
LDI r2, 27
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
