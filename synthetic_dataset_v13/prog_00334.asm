; DESCRIPTION: Loads 25 into r1 and decrements it in a loop until zero.
; PLAN: r1=25(counter), r2=1(step). Loop: SUB r1, r2 then JNZ r1, loop.
LDI r1, 25
loop:
LDI r2, 1
SUB r1, r2
JNZ r1, loop
HALT
