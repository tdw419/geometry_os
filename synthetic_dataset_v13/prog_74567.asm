; DESCRIPTION: Places a yellow 120x53 rectangle at position (221, 197).
; PLAN: r0=221(x), r1=197(y), r2=120(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 197
LDI r2, 120
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
