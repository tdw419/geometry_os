; DESCRIPTION: Places a black 111x86 rectangle at position (171, 38).
; PLAN: r0=171(x), r1=38(y), r2=111(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 38
LDI r2, 111
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
