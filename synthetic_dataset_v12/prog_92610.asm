; DESCRIPTION: Places a yellow 69x53 rectangle at position (429, 182).
; PLAN: r0=429(x), r1=182(y), r2=69(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 182
LDI r2, 69
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
