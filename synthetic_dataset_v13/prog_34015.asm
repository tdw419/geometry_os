; DESCRIPTION: Places a orange 36x64 rectangle at position (263, 165).
; PLAN: r0=263(x), r1=165(y), r2=36(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 165
LDI r2, 36
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
