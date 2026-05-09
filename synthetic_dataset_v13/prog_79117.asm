; DESCRIPTION: Places a magenta 33x90 rectangle at position (171, 161).
; PLAN: r0=171(x), r1=161(y), r2=33(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 161
LDI r2, 33
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
