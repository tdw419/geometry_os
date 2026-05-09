; DESCRIPTION: Places a yellow 111x102 rectangle at position (293, 146).
; PLAN: r0=293(x), r1=146(y), r2=111(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 146
LDI r2, 111
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
